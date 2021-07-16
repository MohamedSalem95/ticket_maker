require 'identicon'

module ApplicationHelper

    def identicon_for(email)
        Identicon.data_url_for email
    end

end
