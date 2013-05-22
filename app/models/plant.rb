class Plant < ActiveRecord::Base
  attr_accessible :zw, :ldm, :cdxzzb, :cl, :xzd, :zygsbw, :sd, :flsgsq, :zhstfwqlpx, :jwzs, :gtsy, :zc, :hjwr, :bctr, :yzxx, :gsydj, :trsfsyxdj, :phmin, :phmax, :apmin, :apmax, :akmin, :akmax, :tnmin, :tnmax, :socmin, :socmax, :sbdmin, :sbdmax, :sfjdx, :sfjhfzmx, :sfjc, :ke, :shu, :bjzwzym, :zysj, :gss, :yjlyqy, :kdzg, :zysq

  def self.import(file)
  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	(3..spreadsheet.last_row).each do |i|
      spreadsheet.row(i).each do |cell|
        cell.to_i if cell.is_a?(Float)
      end
  		row = Hash[[header, spreadsheet.row(i)].transpose]
  		plant = find_by_zw(row["zw"]) || new
  		plant.attributes = row.to_hash.slice(*accessible_attributes)
  		plant.save!
  	end
  end

  def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
  	  when ".csv" then Csv.new(file.path, nil, :ignore)
  	  when ".xls" then Excel.new(file.path, nil, :ignore)
  	  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  	  else raise "Unknown file type: #{file.original_filename}"
	  end
  end

  # def self.import(file)
  #   spreadsheet = Spreadsheet.open file.path
  #   sheet1 = spreadsheet.worksheet 0
  #   binding.pry
  #   (3..spreadsheet.last_row).each do |i|
  #     spreadsheet.row(i).each do |cell|
  #       cell.to_i if cell.is_a?(Float)
  #     end
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     plant = find_by_zw(row["zw"]) || new
  #     plant.attributes = row.to_hash.slice(*accessible_attributes)
  #     plant.save!
  #   end
  # end
end
