class PhotosController < ApplicationController
  #定義首頁檔(for the controller-action "index")
  #在這裡 Photo.all 這個指令會回傳所有在我們的表格資料庫中的相片，以及被指派到 @photos 這個實例變數 (也就是有 @ 開頭的變數) 當中。
  def index
    @photos = Photo.all
  end
end
