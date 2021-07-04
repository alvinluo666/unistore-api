<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class MakeRepository extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:repository {filename}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        //create new repository

        $name = $this->argument('filename');
        // $model = preg_match('//')
        $filePath = app_path().'/Repositories/'.$name.'.php';

        if(file_exists($filePath)){
            $this->error('Repository already exist!');
            return 0;
        }
        $file = fopen($filePath,'w');
        $txt =
"<?php
namespace App\Repositories;

class $name
{
    
}

";
        fwrite($file,$txt);
        fclose($file);

        $this->info('Repository successfully created!');
        return 0;
    }
}
