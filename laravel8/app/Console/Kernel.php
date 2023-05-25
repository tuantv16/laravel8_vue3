<?php

namespace App\Console;

use App\Console\Commands\WordOfTheDay;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
        //'App\Console\Commands\WordOfTheDay',
        Commands\WordOfTheDay::class,
        Commands\DailyQuote::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();

        // $schedule->call(function () {
        //     // User::where('spam_count', '>', 100)
        //     //     ->get()
        //     //     ->each
        //     //     ->delete();
        //     echo 'thuc thi job test';
        // })->everyMinute();
        $schedule->command('word:day')->everyMinute();
        $schedule->command('quote:daily')
        ->everyMinute();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
