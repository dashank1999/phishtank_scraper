# Prvides routes and URLs
class Site
  attr_reader :domain

  def initialize(url)
    @domain = url
  end

  def home
    build_path
  end
  
  def build_path(page_index=0, options={})
    active = options[:active] 
    valid = options[:valid] 

    path = if active or valid
      actives =  "&active=" + (active || "y")
      valid =  "&valid=" + (valid || "y")

      "phish_search.php?page=#{page_index}#{active}#{valid}&Search=Search"
    else
      "phish_archive.php?page=#{page_index}"
    end

    "#{@domain}/#{path}"
  end
 
  def build_detail_path(submission_id)
    "#{@domain}/phish_detail.php?phish_id=#{submission_id}"
  end
end