namespace :interview do
	desc "Create a new interview."
	task :new, [:slug] do |t, args|
		fail "Error: No slug provided" if args.slug.nil?

		date = Time.now.strftime('%Y-%m-%d')
		path = File.join(Dir.pwd, '_posts', "#{date}-#{args.slug}.interview")

		fail "Error: Interview already exists." if File.exists?(path)

		template = <<INTERVIEW
---
layout: interview
slug: #{args.slug}
title: ""
summary: ""
categories: []
---

### Who are you, and what do you do?

### What hardware do you use?

### And what software?

### What would be your dream setup?
INTERVIEW

		File.open(path, 'w') { |f| f.write(template) }
		sh "open #{path}"
	end
end

namespace :ware do
	task :new, [:slug, :is_hardware] do |t, args|
		fail "Error: No slug provided" if args.slug.nil?

		path = File.join(Dir.pwd, 'wares', "#{args.slug}.yml")
		fail "Error: Ware already exists." if File.exists?(path)

				template = <<WARE
---
name: ""
description: ""
type: #{args.is_hardware ? 'hardware' : 'software'}
url: http://
WARE

		File.open(path, 'w') { |f| f.write(template) }
		sh "open #{path}"
	end
end

namespace :hardware do
	desc "Create a new hardware entry."
	task :new, [:slug] do |t, args|
		Rake::Task['ware:new'].invoke(args.slug, true)
	end
end

namespace :software do
	desc "Create a new software entry."
	task :new, [:slug] do |t, args|
		Rake::Task['ware:new'].invoke(args.slug, false)
	end
end