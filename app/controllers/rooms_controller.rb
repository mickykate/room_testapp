class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:title, :introduction, :room_rate))
    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to rooms_path
    else
        render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:title, :introduction, :room_rate))
      flash[:notice] = "「#{@room.id}」の情報を更新しました"
      redirect_to room_path(@room)
    else
      flash[:alert] = "施設の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
     flash[:notice] = "施設を削除しました。"
     redirect_to rooms_path
  end
end
