require 'csv'

class StartController < ApplicationController
  before_action :set_start, only: [:show, :edit, :update, :destroy]

  def import
    uri = URI('https://dl.dropboxusercontent.com/u/6582068/products.csv')
    csv_data = Net::HTTP.get(uri)
    csv = CSV.parse(csv_data, :headers => true, :header_converters => [:downcase] )
    csv.each do |row|
      row_hash = row.to_hash
      row_hash[:product_id] = row_hash.delete('productid')
      row_hash[:name] = row_hash.delete('product name')
      row_hash[:category] = row_hash.delete('category')

      category = Category.find_by_name(row_hash[:category]) || Category.new(:name => row_hash[:category])
      category.save

      row_hash[:category] = category

      product = Product.find_by_product_id(row_hash[:id])
      if product != nil
        product.update(row_hash)
      else
        product = Product.create(row_hash)
      end
      product.save!
    end

    redirect_to categories_url, notice: 'Import Complete.'
  end
end
