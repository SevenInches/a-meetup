node(:status) { 'success' }
child(@user => :data){
	attributes :id, :name, :email, :avatar, :created_at, :authentication_token
}	