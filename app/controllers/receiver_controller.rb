class ReceiverController < ApplicationController
  def home
    @last = Ping.last
    case @last.service
      when "ipad"
        @text = "iPadのアプリ起動"
      when "myhouse"
        @text = "板橋区の新居"
      when "train"
        @text = "電車の中"
      when "eat"
        @text = "食事中"
      when "admin"
        @text = "このWebアプリの管理者ページへのログイン"
      else
        @text = "何かしらの行動"
    end
  end

  def post(service)
    ping = Ping.new(:uuid => SecureRandom.uuid, :service => service)
    ping.save
  end

  def ipad
    post("ipad")
  end

  def myhouse
    post("myhouse")
  end

  def train
    post("train")
  end

  def eat
    post("eat")
  end

  def admin
    # post("admin")
  end
end
