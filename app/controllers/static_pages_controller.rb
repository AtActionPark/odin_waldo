class StaticPagesController < ApplicationController

  def home
    @@counter = 0;
    @@start = Time.now
  end

  def checkCharacter
    answer = checkAnswer(params[:x],params[:y],params[:character]);
    if (@@counter == 3)
      flash[:custom] = "Nice! Finished in #{score} seconds"
      render js: "location.reload()"
    else
      render json: answer
    end
    
  end

  def score 
    ( Time.now - @@start ).floor
  end

  def checkAnswer x,y,name
    c = Character.where(name: name.to_s)[0] 
    if(x.to_i> c.left.to_i && x.to_i<c.left.to_i + c.width.to_i && y.to_i>c.top .to_i && y.to_i<c.top.to_i + c.height.to_i)
      @@counter += 1
      return { name: c.name, top: c.top,  left: c.left, width: c.width, height: c.height }
    else
      false
    end
  end

end
