class CityPhotosController < ApplicationController
  def destroy
    @city_photo=CityPhoto.find(params[:id])
    @city_photo.destroy

    respond_to  do |format|
      format.js { render :xml => "destroied" }
    end
  end
end
