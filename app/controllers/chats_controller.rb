class ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])

    # カレントユーザーのuser_roomsにあるroom_idの値の配列を代入
    rooms = current_user.user_rooms.pluck(:room_id)

    # user_roomモデルから、user_idがチャット相手のidが一致するものと、
    # room_idが上記roomsのどれかに一致するレコードをuser_roomsに代入
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    unless user_rooms.nil?
      # @roomに上記user_roomのroomを代入
      @room = user_rooms.room
    else
      # それ以外は新しくroomを作り、
      @room = Room.new
      @room.save
      # user_roomをカレントユーザー分とチャット相手分を作る
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private
  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end

end
