node(:status) { 'success' }
child(@issue => :issue){
	attributes :id, :title, :content, :created_at
	child(:user => :user){attributes :id, :name, :email}
	child(@comments => :comments){attributes :id, :content, :created_at, :floor
		child(:user){attributes :id, :name}
	} 	
}	