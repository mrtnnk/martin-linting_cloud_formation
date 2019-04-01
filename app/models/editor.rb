class Editor < ApplicationRecord
  mount_uploader :cfgfile, CfgvalidatorUploader
  attr_accessor :cfgfile
end
