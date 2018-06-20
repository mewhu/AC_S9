class PhotosController < ApplicationController
  #定義首頁檔(for the controller-action "index")
  #在這裡 Photo.all 這個指令會回傳所有在我們的表格資料庫中的相片，以及被指派到 @photos 這個實例變數 (也就是有 @ 開頭的變數) 當中。
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  #def create及def photo_parms : 使"new"頁面最後的submit-button可以真正送data到rails-web裡
  #def photo_params使用private method式的定義
  #把讀取 params 的過程包在 photo_params 裡，再從 create action 裡呼叫，送給Photo.new 做為參數。
  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photos_url
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end
end
