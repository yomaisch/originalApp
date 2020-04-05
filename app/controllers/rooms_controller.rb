# frozen_string_literal: true

class RoomsController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @messages = Message.all
   end
end
