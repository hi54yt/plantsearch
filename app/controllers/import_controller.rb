class ImportController < ApplicationController
  def index
  end

  def destroy
    Plant.delete_all
    Flsgsq.delete_all
    Gsydj.delete_all
    Trsfsyxdj.delete_all
    render 'index'
  end
end
