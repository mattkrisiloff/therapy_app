module TherapistsHelper
  def check_if_subsections_exist
    @therapist = current_therapist
    if @therapist.approach_sub1.nil?
    else
  		if @therapist.approach_sub1.empty?
  			@approach1_style = "none"
        @approach1_title_style = "block"
  		else
  			@approach1_style = "block"
        @approach1_title_style = "none"
  		end
		
  		if @therapist.approach_sub2.empty?
  			@approach2_style = "none"
        @approach2_title_style = "block"
  		else
  			@approach2_style = "block"
        @approach2_title_style = "none"
  		end
    end
  end
  
  def define_subdomain
    if Rails.env.development?
      @subdomain = ''
    elsif Rails.env.production?
      @subdomain = 'www'
    end
  end
  
  def define_video_path_root
    if Rails.env.development?
      @root = "/assets/therapists/"
    elsif Rails.env.production?
      @root = "https://s3.amazonaws.com/scouterapp-therapist-assets/therapists/"
    end
  end
  
  def define_time_variables(i)
    @adjusted_time = (Time.now + 1.day).in_time_zone(@time_zone)
		@time = (@adjusted_time.beginning_of_day + (0.5*i).hours).strftime('%l:%M%P').strip
		@h = (@adjusted_time.beginning_of_day + (0.5*i).hours).strftime('%l').strip
		@m = (@adjusted_time.beginning_of_day + (0.5*i).hours).strftime('%M').strip
		@i = (@adjusted_time.beginning_of_day + (0.5*i).hours).strftime('%P').strip
  end
end
