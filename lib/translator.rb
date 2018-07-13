require "yaml"
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_fil(file_path)
  translations = {"get_meaning" => {},"get_emoticon" => {} } 
  translations.each do |keys,values|
    emoticons.each do |text,emotes|
      if keys == "get_meaning"
        values[emotes[1]] = text 
      else 
        values[emotes[0]] = emotes[1]
      end
    end
  end
  translations
end

def get_japanese_emoticon path,emoticon 
  emoticon_hash = load_library path
  emoticon_hash["get_emoticon"].each do |eng,jap|
    if emoticon == eng 
      return jap
    end
  end
end

def get_english_meaning path,emoticon
  emoticon_hash = load_library path 
  
  emoticon_hash["get_meaning"].each do |emo,text|
    if emoticon == emo 
      return text 
    end
  end
end

load_library('lib/emoticons.yml')

#puts get_english_meaning path,"(＾ｖ＾)"