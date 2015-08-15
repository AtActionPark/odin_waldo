class StaticPagesController < ApplicationController
  def home
  end

  def locations
    answer = checkAnswer(params[:x],params[:y],params[:character]);
    render json: answer
  end

  def save_score 
    duration = ( Time.now - Time.parse(session[:start_time]) ).floor
  end

  def checkAnswer x,y,name
    c = Character.where(name: name.to_s)[0] 
    if(x.to_i> c.left.to_i && x.to_i<c.left.to_i + c.width.to_i && y.to_i>c.top .to_i && y.to_i<c.top.to_i + c.height.to_i)
      { name: c.name, top: c.top,  left: c.left, width: c.width, height: c.height }
    else
      false
    end
  end

end
