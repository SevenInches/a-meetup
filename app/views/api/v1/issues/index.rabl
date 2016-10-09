node(:status) { 'success' }
node(:total) { @total }
child(@issues => :issues){
	attributes :id, :title, :content, :created_at
	child(:user => :user){attributes :id, :name, :email}	
}	