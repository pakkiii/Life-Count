class LivesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :search]
  def index
    @lives = Life.all.order("created_at DESC")
  end


  def new
    @life = Life.new
  end

  def create
    @life = Life.new(life_params)
    if @life.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @life = Life.find(params[:id])
    @lives = Life.all.order("created_at DESC")
    @like = Like.new
    @yell = Yell.new
    @yells = @life.yells
  end


  def search
    @lives = Life.search(params[:keyword])
  end


  def private
  end

  def family
  end

  def work
  end

  def school
  end

  def other
  end

  def help
  end

  def about
  end

  def caution
  end



  private


  def life_params
    params.require(:life).permit(:bad_thing, :hope, :tired_id, :how_long_id, :want_id, :month_id).merge(user_id: current_user.id)
  end
end
