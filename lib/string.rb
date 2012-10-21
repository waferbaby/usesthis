class String
        def to_slug
                require 'iconv'
                Iconv.conv('ASCII//TRANSLIT//IGNORE', 'UTF8', self).gsub(/[^a-zA-Z ]/, '').gsub(/[ ']/, '.').downcase
        end
end