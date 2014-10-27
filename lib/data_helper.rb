require 'csv'
require 'UUID'

module DataHelper


  def self.load_interval_data(infile, meter_id, building_id)
    uuid = UUID.new
    analysis_id = uuid.generate

    CSV.foreach(infile, :headers => true) do |row|
      day  = IntervalData.new
      day.processed_raw_data_id = uuid.generate
      day.usage_date = Date.strptime(row[0], "%m/%d/%Y")
      #day.meter_id = row[1]
      day.meter_id = meter_id
      #day.building_id = row[2]
      day.building_id = building_id
      day.analysis_id = analysis_id
      day.processed_raw_data_id = uuid.generate
      (2..97).each do |i|
        day.send("interval_#{i.to_i - 1}=", row[i])
      end
      day.save!
    end
  end

  def self.generate_chart_data(outdir, building_id, billing_rate, start_date)
    building = Building.find_by_building_id(building_id)
    meters =Meter.all.where(:building_id => building_id)

    monthly_totals = []
    cost_totals = []
    sdate = Time.parse(start_date)
    puts "------------------"
    puts "start_date = #{sdate}"
    puts "------------------"

    sdays = sdate.end_of_month.day

    if meters.length == 1
      meter = meters[0]
      interval_data = IntervalData.all.where(:meter_id => meter.meter_number).order('usage_date ASC')

      puts "-----------------"
      puts "interval data length = #{interval_data.length}"
      puts "-----------------"
      total = 0
      index = 0
      #first month
      (0..sdays-sdate.day).each do |d|
        row = interval_data[d]
        index += 1
        (1..96).each do |i|
          total = total + row.send("interval_#{i.to_i}")
        end
      end
      arr = []
      costarr = []
      arr <<  "#{sdate.strftime('%Y-%m-%d')}"
      costarr <<  "#{sdate.strftime('%Y-%m-%d')}"
      arr << total.ceil
      costarr << total.ceil * billing_rate
      monthly_totals << arr
      cost_totals << costarr
      #monthly_totals["#{sdate.strftime('%Y-%m-%d')}"]=  total

      puts "-----------------"
      puts "index = #{index}"
      puts "-----------------"

      #rest of 11 months
      (1..11).each do |m|
        total = 0
        sdate = sdate.next_month.beginning_of_month
        puts sdate
        (sdate.beginning_of_month.day..sdate.end_of_month.day).each do |d|
          if interval_data.length >  index+d
            row = interval_data[index+d]
            index += 1
            puts index
            (1..96).each do |i|
                val = row.send("interval_#{i.to_i}")
                if val != nil
                  total = total + val
                end
            end
          end
        end
        arr = []
        costarr = []
        arr <<  "#{sdate.strftime('%Y-%m-%d')}"
        costarr <<  "#{sdate.strftime('%Y-%m-%d')}"
        arr << total.ceil
        costarr << (total.ceil * billing_rate)/100
        monthly_totals << arr
        cost_totals << costarr
        #monthly_totals["#{sdate.strftime('%Y-%m-%d')}"]=  total
      end

      puts "-----------------------"
      puts monthly_totals
      puts "-----------------------"

      #6_months_your_usage.json
      outfile = File.open(outdir + "/6_months_your_usage.json", 'w')
      outfile.write("[")
      (5..11).each do |i|
        outfile.write(monthly_totals[i])
        if (i < 11)
          outfile.write(", ")
        end
      end
      outfile.write("]")
      outfile.close

      outfile = File.open(outdir + "/6_months_categories.json", 'w')
      outfile.write("[")
      (5..11).each do |i|
        outfile.write("'" + "#{Time.parse(monthly_totals[i][0]).strftime('%b')}"+ "'")
        if (i < 11)
          outfile.write(", ")
        end
      end
      outfile.write("]")
      outfile.close

      #6_months_your_cost.json
      outfile = File.open(outdir + "/6_months_your_cost.json", 'w')
      outfile.write("[")
      (5..11).each do |i|
        outfile.write(cost_totals[i])
        if (i < 11)
          outfile.write(", ")
        end
      end
      outfile.write("]")
      outfile.close


    else
      #handle multiple meter case
    end
    return monthly_totals
  end


    def self.dbtojson_interval_data(building_id, start_date, end_date, outfile)

    rows = IntervalData.where(:building_id => building_id, :usage_date => start_date..end_date)
    out1 = File.open(outfile, 'w')
    out1.write("[")
    rows.each do |row|
      (1..96).each do |i|
        out1.write(row.send("interval_#{i.to_i}"))
        out1.write(", ")
      end
    end
    out1.write("]")
    out1.close
  end


  def self.load_buildings
    CSV.foreach('public/gsa_buildings_data.csv', :headers => true) do |row|
      hash = row.to_hash.symbolize_keys
      puts hash
      #Building.create!(row.to_hash)
      Building.create(hash)
    end
  end

  def self.xmltojson_wet_bulb(input, outdir)
    doc = Nokogiri::XML(File.open(input))

    out1 = File.open(outdir + '/categories.json', 'w')

    intervals = doc.xpath("//chart/series/value")
    out1.write("[")
    intervals.each do |i|
      out1.write(i.text)
      out1.write(", ")
    end
    out1.puts("]")
    out1.close

    block = doc.xpath("//graphs/graph[@gid='0']/value")
    out = File.open(outdir + '/occupied_hours.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='1']/value")
    out = File.open(outdir + '/unoccupied_hours.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

  end

  def self.xmltojson_monthly_consumption(input, outdir)
    doc = Nokogiri::XML(File.open(input))

    out1 = File.open(outdir + '/categories.json', 'w')

    intervals = doc.xpath("//chart/series/value")
    out1.write("[")
    intervals.each do |i|
      out1.write(i.text)
      out1.write(", ")
    end
    out1.puts("]")
    out1.close

    block = doc.xpath("//graphs/graph[@gid='0']/value")
    out = File.open(outdir + '/consumption.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='1']/value")
    out = File.open(outdir + '/peak_demand.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

  end

  def self.xmltojson_days_of_week(input, outdir)
    doc = Nokogiri::XML(File.open(input))

    out1 = File.open(outdir + '/categories.json', 'w')

    intervals = doc.xpath("//chart/series/value")
    out1.write("[")
    intervals.each do |i|
      out1.write(i.text)
      out1.write(", ")
    end
    out1.puts("]")
    out1.close

    block = doc.xpath("//graphs/graph[@gid='1']/value")
    out = File.open(outdir + '/monday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='2']/value")
    out = File.open(outdir + '/tuesday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='3']/value")
    out = File.open(outdir + '/wednesday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='4']/value")
    out = File.open(outdir + '/thursday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='5']/value")
    out = File.open(outdir + '/friday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='6']/value")
    out = File.open(outdir + '/saturday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='7']/value")
    out = File.open(outdir + '/sunday.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

  end

  def self.xmltojson_peak_demand(input, outdir)

    doc = Nokogiri::XML(File.open(input))

    #out1 = File.open('public/data/interval_data/peak_demand/intervals.json', 'w')

    #intervals = doc.xpath("//chart/series[@id='interval']/value")
    #out1.write("[")
    #intervals.each do |i|
    #  out1.write(i.text)
    #  out1.write(", ")
    #end
    #out1.puts("]")
    #out1.close

    block = doc.xpath("//graphs/graph[@gid='0']/value")
    out = File.open(outdir + '/peak_demand_day_1.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='1']/value")
    out = File.open(outdir + '/peak_demand_day_2.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='2']/value")
    out = File.open(outdir + '/peak_demand_day_3.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='3']/value")
    out = File.open(outdir + '/peak_demand_day_4.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='4']/value")
    out = File.open(outdir + '/peak_demand_day_5.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='5']/value")
    out = File.open(outdir + '/peak_demand_day_6.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='6']/value")
    out = File.open(outdir + '/peak_demand_day_7.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='7']/value")
    out = File.open(outdir + '/peak_demand_day_8.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='8']/value")
    out = File.open(outdir + '/peak_demand_day_9.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.puts("]")
    out.close

    block = doc.xpath("//graphs/graph[@gid='9']/value")
    out = File.open(outdir + '/peak_demand_day_10.json', 'w')
    out.write("[")
    block.each do |i|
      out.write(i.text)
      out.write(", ")
    end
    out.write("]")
    out.close


  end

  def self.aggregate_meter_data_json(meters, outfile)
    out = File.open(outfile, 'w')
    adata = Hash.new

    meters.each do |meter_id|
      mdata = Array.new
      rows = IntervalData.where(:meter_id => meter_id).order('usage_date ASC').limit(365)
      rows.each do |row|
        (1..96).each do |i|
          mdata << row.send("interval_#{i}")
        end
      end
      puts"-------------"
      puts mdata.length
      puts"-------------"
      adata[meter_id] =  mdata
    end


    out.write("[")
    (1..365*96).each do |i|
      val = 0
      meters.each do |meter_id|
        puts "i = #{i}, val = #{ adata[meter_id][i]}"
        if adata[meter_id][i] == nil
          adata[meter_id][i] = 0
        end
        val += adata[meter_id][i]
      end
      out.write(val.round(2))
      out.write(", ")
    end
    out.write("]")
    out.close
  end


  def self.meter_data_json(meter_id, outfile)

    rows = IntervalData.where(:meter_id => meter_id).order('usage_date ASC').limit(365)
    out = File.open(outfile, 'w')
    out.write("[")
    data = Array.new

    rows.each do |row|
      (1..96).each do |i|
        out.write(row.send("interval_#{i}"))
        out.write(", ")
      end
    end
    out.write("]")
    out.close
  end



end
