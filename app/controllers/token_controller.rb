class TokenController < ApplicationController
  def new
    @tiny = Tiny.new
  end

  def create
    @tiny = Tiny.new long: params[:long]
    if @tiny.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    if tiny.present?
      record_access
      redirect_to tiny.long
    else
      render json: {error: 'Page not found'}, status: 404
    end
  end

  def info
    @total = Tape.where(tiny_id: tiny.id).count
  end

  protected

  def tiny
    @tiny ||= Tiny.where(short: params[:token]).first
  end

  def record_access
    Tape.create ip: request.remote_ip, user_agent: request.user_agent, tiny: @tiny
  end
end
