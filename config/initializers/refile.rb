# refileスマホからのアップロード時の写真の向き調整
require "refile/mini_magick"
Refile::MiniMagick.prepend Module.new {
  [:limit, :fit, :fill, :pad].each do |action|
    define_method(action) do |img, *args|
      super(img, *args) { |cmd| cmd.auto_orient }
    end
  end
}
