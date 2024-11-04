class MonumentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_monument, only: [ :show, :edit, :update, :destroy ]

  def index
    @monuments = Monument.all
  end

  def show
  end

  def new
    @monument = Monument.new
  end

  def create
    @monument = current_user.monuments.build(monument_params)
    if @monument.save
      redirect_to @monument, notice: "\u041F\u0430\u043C\u2019\u044F\u0442\u043A\u0430 \u0443\u0441\u043F\u0456\u0448\u043D\u043E \u0441\u0442\u0432\u043E\u0440\u0435\u043D\u0430."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @monument.update(monument_params)
      redirect_to @monument, notice: "\u041F\u0430\u043C\u2019\u044F\u0442\u043A\u0430 \u0443\u0441\u043F\u0456\u0448\u043D\u043E \u043E\u043D\u043E\u0432\u043B\u0435\u043D\u0430."
    else
      render :edit
    end
  end

  def destroy
    @monument.destroy
    redirect_to monuments_url, notice: "\u041F\u0430\u043C\u2019\u044F\u0442\u043A\u0430 \u0443\u0441\u043F\u0456\u0448\u043D\u043E \u0432\u0438\u0434\u0430\u043B\u0435\u043D\u0430."
  end

  private

  def set_monument
    @monument = Monument.find(params[:id])
  end

  def monument_params
    params.require(:monument).permit(:name, :description, :photo)
  end
end
