module FormatHelper

	def custom_format name='Guest'
		"Hello #{name}"
	end


	def custom_class alert_type = 'success'
		return "alert alert-success" if alert_type == 'success'
		return "alert alert-danger" if alert_type == 'alert'
		return "alert alert-warning" if alert_type == 'warning'
		return "alert alert-info" if alert_type == 'info'
	end
	
end