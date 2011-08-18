class FaceController < ApplicationController

  def index
    @oauth = Koala::Facebook::OAuth.new('105519826206949', '92e83b71b655c1c7ba19f707ce2f780c', 'http://localhost:3000/face/index')





  end

end

