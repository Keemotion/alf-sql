namespace :bench do

  task :run do
    cmd = "bundle exec ruby -Ilib -I spec/integration/ spec/integration/bench_all.rb"
    $stderr.puts cmd
    exec(cmd)
  end

  task :summary do
    cmd = "bundle exec ruby -Ilib -I spec/integration/ spec/integration/bench_all.rb"
    cmd << " | "
    cmd << "alf --ff=%.6f --input-reader=rash summarize -- category -- min 'min{ total }' max 'max{ total }' stddev 'stddev{ total }'"
    $stderr.puts cmd
    exec(cmd)
  end

  task :rank do
    cmd = "bundle exec ruby -Ilib -I spec/integration/ spec/integration/bench_all.rb"
    cmd << " | "
    cmd << "alf --input-reader=rash rank -- total desc -- position"
    cmd << " | "
    cmd << "alf --input-reader=rash project -- position category query parsing compiling printing total"
    cmd << " | "
    cmd << "alf --ff=%.6f --input-reader=rash restrict -- 'position < 10'"
    $stderr.puts cmd
    exec(cmd)
  end

end
task :bench => :"bench:run"