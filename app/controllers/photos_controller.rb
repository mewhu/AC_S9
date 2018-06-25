class PhotosController < ApplicationController
  ####################################################
  ########## 以下為controller action "index" ##########
  ####################################################
  #定義首頁檔(for the controller-action "index")
  #在這裡 Photo.all 這個指令會回傳所有在我們的表格資料庫中的相片，以及被指派到 @photos 這個實例變數 (也就是有 @ 開頭的變數) 當中。
  def index
    @photos = Photo.all
  end


  ##############################################################
  ########## 以下為controller action "new" 及 "create" ##########
  ##############################################################
  #定義new頁面
  def new
    #叫controller用model "Photo"中的new方法去取得資料，並且用@photo實例變數接住，送去給new頁面
    @photo = Photo.new
  end

  #def create及def photo_parms : 使"new"頁面最後的submit-button可以真正送data到rails-web裡
  #def photo_params使用private method式的定義
  #把讀取 params 的過程包在 photo_params 裡，再從 create action 裡呼叫，送給Photo.new 做為參數。
  #photos_url : index-action的RESTful prefix "photos" 配上 "_url", 可以産生index首頁的URL位置
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to photos_url
    else
      render :action => :new
    end
  end


  ###################################################
  ########## 以下為controller action "show" ##########
  ###################################################
  def show
    #叫controller用model "Photo"中的find(params[:id])方法去取得資料，並且用@photo實例變數接住，送去給show頁面
    @photo = Photo.find(params[:id])
  end


  ###############################################################
  ########## 以下為controller action "edit" 及 "update" ##########
  ###############################################################
  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      #設定update結束後將頁面導到該@photo的"show"頁面
      redirect_to photo_path(@photo)
    else
      render :action => :edit
    end
  end


  ######################################################
  ########## 以下為controller action "destroy" ##########
  ######################################################
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url
  end


  private
  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end



end
