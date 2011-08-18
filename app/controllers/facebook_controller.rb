class FacebookController < ApplicationController


  FB_APP_ID     = '105519826206949'
  FB_SECRET = '92e83b71b655c1c7ba19f707ce2f780c'
  ACCESS_TOKEN = '105519826206949|2.AQDU-lFEsEUAM2GL.3600.1308805200.1-100002098253158|RzHH1rT4xLyLRyomuGdihW-0LL0&expires_in=6661'
  HOST = 'http://localhost:3000/'
  @uri = 'https://www.facebook.com/dialog/oauth?client_id=105519826206949
     &redirect_uri=http://apps.facebook.com/app_facebok/&scope=email,read_stream, manage_pages, offline_access, publish_stream, user_likes, friends_likes, friends_about_me, user_about_me'
     @code = "U9MmcYOsBHJs3RrK2WMN_rBXB0RHW2YhaD2ISNsRNfM.eyJpdiI6Ilk2MHZvbUI1TDNodzM0c2hzM3l4WkEifQ._UHXynbcVNnSfN73NhAq7skn2Hd_X-gCVeVP478VIqOGZjy-NffIqU6tZpdMdaTqWXmd3rHi6j7AYFzoBY5AWN2jPFPBtSNVkIREcCxZu-q00Id8d9MRrIR4cZw2VjPl"

  @uri = 'https://graph.facebook.com/oauth/access_token?
     client_id=105519826206949&redirect_uri=/&
     client_secret=92e83b71b655c1c7ba19f707ce2f780c&code='

    @codigo = '154132764658706'

  def index


    #manipulando api do facebook na mao

    @app_id= FB_APP_ID
    @app_secret = FB_SECRET
    @scope = "email,read_stream, manage_pages, offline_access, publish_stream, user_likes, friends_likes, friends_about_me, user_about_me"
    @uri="http://localhost:3000/facebook/index"
    @uid="100002098253158"
    @message = "publicando conteudo atravez do rails api"
    # nova parte facebook
    @urlcallback = "https://www.facebook.com/dialog/oauth?
     client_id=#{@app_id}&redirect_uri=#{@uri}&scope=#{@scope}"

    @code1 = "a88MoVAQw6IrnPBF63IK62dCetr0iaPA-aEMdQGyjdY.eyJpdiI6IkZCM2tUNFJmZUpsWlNPNVRUNEdfa1EifQ.VWMFkT0hvFSdrxYhcRDBaiOYeyJvtru5OtPWstwDQ4o754-2rtpmjd1bIChZZIS5FftpNHtXupQFDj-W42X5b0mtyrequ1cZUPNPfphMnYQix1r0ZEoCglVSo74kBz88"
    @code2 = "-9YFRIIiqEuNvx5yiiiCKb9h2u3Xj8_4gYHKYl6eDIE.eyJpdiI6IlM3Q3RiOTJFZTdMTWdQSk04U0l5Z2cifQ.rqmsTIWdc4F5FXE5PyFel7_VPwK91S7imYHplbxpk1ngTHXb6TqxyQ9fokKcmVMpYaxIUpk_uIqZmq-iyT5yHfBCEJsn7t_PxBdeWAqPMcwDNZKU7JTRy1X1J1N9e3Il"

    @access_token_url = "https://graph.facebook.com/oauth/access_token?
     client_id=#{@app_id}&redirect_uri=#{@uri}&
     client_secret=#{@app_secret}&code=#{@code2}"

     @meustokens = "https://graph.facebook.com/me/accounts?access_token=105519826206949|8f12acd6206fa53c8e61de8b.1-100002098253158|f6unvHDryjZTbgj_V2Cf-7gGRdI"

     @access_token = "105519826206949|8f12acd6206fa53c8e61de8b.1-100002098253158|f6unvHDryjZTbgj_V2Cf-7gGRdI"

     @opengp_url = "https://graph.facebook.com/105519826206949"

     @graph_url = "https://graph.facebook.com/me?access_token=#{@access_token}"

     @wallpublish = "http://www.facebook.com/dialog/feed?app_id=#{@app_id}&redirect_uri=#{@uri}&message=#{@message}&method=post"

     @feed_url = "http://www.facebook.com/dialog/feed?app_id=#{@app_id}&redirect_uri=#{@uri}&message=#{@message}"

     @listagem_amigos = "https://graph.facebook.com/me/friends?access_token=#{@access_token}"

     @convit = "http://www.facebook.com/dialog/apprequests?app_id=#{@app_id}&redirect_uri=#{@uri}&message=#{@message}"



   end

  def callback
    #session[:me] = FbGraph::User.me(ACCESS_TOKEN)
    #session[:user] = params[:code]
    #validacao.@params
    @app_id= FB_APP_ID
    @app_secret = FB_SECRET
    @code = session[:user]
    @uri="http://localhost:3000/facebook/validacao"

    @access_token_url = "https://graph.facebook.com/oauth/access_token?
     client_id=#{@app_id}&redirect_uri=#{@uri}&
     client_secret=#{@app_secret}&code=#{@code}"
  end

  def new
   fb_auth = FbGraph::Auth.new(FB_APP_ID, FB_SECRET)
   client = fb_auth.client
   client.redirect_uri = "http://localhost:3000/facebook/index"
  end

  def validacao


    @app_id= FB_APP_ID
    @app_secret = FB_SECRET
    @code = params[:code]

    session[:user] = params[:code]
    @message = "publicando conteudo atravez do rails api"


    # minha url de callback
    @uri="http://localhost:3000/facebook/validacao"

    # escopo de privilegios
    @scope = "email,read_stream, manage_pages, offline_access, publish_stream, user_likes, friends_likes, friends_about_me, user_about_me"

    #carregando os dados para fazer o login e ser redirecionado de volta
    @facebook_login = "https://www.facebook.com/dialog/oauth?
     client_id=#{@app_id}&redirect_uri=#{@uri}&scope=#{@scope}"


    #publicar no wall
    @wallpublish = "http://www.facebook.com/dialog/feed?app_id=#{@app_id}&redirect_uri=#{@uri}&message=#{@message}&method=post"

  end



end

