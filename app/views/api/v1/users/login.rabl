node(:status) { 'success' }
child(@user => :data){
	attributes :id, :name, :email, :created_at
}	