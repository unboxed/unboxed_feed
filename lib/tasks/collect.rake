desc "Collect Unboxed feeds"
task :collect_feeds => :environment do
	UnboxedBlog.content_items
	UnboxedTwitter.content_items
end
