#encoding: utf-8
class Plant < ActiveRecord::Base
  attr_accessible :zw, :ldm, :cdxzzb, :cl, :xzd, :zygsbw, :sd, :flsgsq, :zhstfwqlpx, :jwzs, :gtsy, :zc, :hjwr, :bctr, :yzxx, :gsydj, :trsfsyxdj, :phmin, :phmax, :apmin, :apmax, :akmin, :akmax, :tnmin, :tnmax, :socmin, :socmax, :sbdmin, :sbdmax, :sfjdx, :sfjhfzmx, :sfjc, :ke, :shu, :bjzwzym, :zysj, :gss, :yjlyqy, :kdzg, :zysq
  has_many :flsgsqs
  has_many :gsydjs
  has_many :trsfsyxdjs

  scope :ak_between, lambda {|value| where("? between akmin and akmax", value.to_i)}
  scope :ap_between, lambda {|value| where("? between apmin and apmax", value.to_i)}
  scope :soc_between, lambda {|value| where("? between socmin and socmax", value.to_i)}
  scope :tn_between, lambda {|value| where("? between tnmin and tnmax", value.to_i)}
  scope :ph_between, lambda {|value| where("? between phmin and phmax", value.to_i)}
  scope :sbd_between, lambda {|value| where("? between sbdmin and sbdmax", value.to_i)}

  scope :zhstfwqlpx_range, lambda {|value| where("zhstfwqlpx between ? and ?", value.split('-').first.to_i, value.split('-').last.to_i)}
  scope :zc_range, lambda {|value| where("zc between ? and ?", value.split('-').first.to_i, value.split('-').last.to_i)}


  search_methods :zhstfwqlpx_range, :zc_range, :ak_between, :ap_between, :soc_between, :tn_between, :ph_between, :sbd_between

  def self.import(file)
  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	(3..spreadsheet.last_row).each do |i|

  		row = Hash[[header, spreadsheet.row(i)].transpose]
      row["flsgsq"] = row["flsgsq"].to_i.to_s if row["flsgsq"].is_a?(Float)
      row["gsydj"] = row["gsydj"].to_i.to_s if row["gsydj"].is_a?(Float)
      row["trsfsyxdj"] = row["trsfsyxdj"].to_i.to_s if row["trsfsyxdj"].is_a?(Float)

      row["zhstfwqlpx"] = row["zhstfwqlpx"].to_i if row["zhstfwqlpx"].is_a?(Float)
      row["jwzs"] = row["jwzs"].to_i if row["jwzs"].is_a?(Float)
      row["gtsy"] = row["gtsy"].to_i if row["gtsy"].is_a?(Float)
      row["zc"] = row["zc"].to_i if row["zc"].is_a?(Float)
      row["bctr"] = row["bctr"].to_i if row["bctr"].is_a?(Float)

  		plant = find_by_zw(row["zw"]) || new
  		plant.attributes = row.to_hash.slice(*accessible_attributes)
  		plant.save!

      #TODO 导入可覆盖原数据 
      row["flsgsq"].split(',').each do |flsgsq_month|
        plant.flsgsqs.create(:month => flsgsq_month)
      end unless row["flsgsq"] == nil

      row["gsydj"].split(',').each do |gsydj_level|
        plant.gsydjs.create(:level => gsydj_level)
      end unless row["gsydj"] == nil

      row["trsfsyxdj"].split(',').each do |trsfsyxdj_level|
        plant.trsfsyxdjs.create(:level => trsfsyxdj_level)
      end unless row["trsfsyxdj"] == nil
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

  def self.flsgsq_lists
    [['1月', 1], ['2月', 2], ['3月', 3], ['4月', 4], ['5月', 5], ['6月', 6], ['7月', 7], ['8月', 8], ['9月', 9], ['10月', 10], ['11月', 11], ['12月', 12]]
  end

  def self.gsydj_lists
    1..7
  end

  def self.trsfsyxdj_lists
    1..7
  end

  def self.zhstfwqlpx_lists
    ['1-30', '30-70', '70-100']
  end

  def self.zc_lists
    ['1-30', '30-70', '70-100']
  end

  # def zhstfwqlpx
  #   read_attribute(:zhstfwqlpx).to_i
  # end

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
