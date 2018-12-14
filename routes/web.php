<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::post('/language', 'languageController@changeLanguage')->name('language.change');
Route::get('/social-login/redirect/{provider}', 'Auth\LoginController@redirectToProvider')->name('social.login');
Route::get('/social-login/{provider}/callback', 'Auth\LoginController@handleProviderCallback')->name('social.callback');

Route::group(['middleware' => ['auth']], function(){
		Route::get('/', 'HomeController@index')->name('home');
		Route::get('/assigned-projects', 'HomeController@assigned_projects')->name('home.projects');
		Route::get('/assigned-tasks', 'HomeController@assigned_tasks')->name('home.tasks');

		Route::resource('projects', 'ProjectController');
		Route::get('/projects/destroy/{id}', 'ProjectController@destroy')->name('projects.destroy');

		Route::resource('stories', 'StoryController');
		Route::get('/story/{id}', 'StoryController@index')->name('stories.index');
		Route::get('/stories/create/{id}', 'StoryController@create')->name('stories.create');

		Route::resource('tasks', 'TaskController');
		Route::get('/task/{id}', 'TaskController@index')->name('tasks.index');
		Route::get('/tasks/create/{id}', 'TaskController@create')->name('tasks.create');
		Route::get('/task/status/done/{id}', 'TaskController@done')->name('tasks.done');
		Route::get('/task/status/undo/{id}', 'TaskController@undo')->name('tasks.undo');
		Route::get('/task/status/doing/{id}', 'TaskController@doing')->name('tasks.doing');

		Route::resource('contributors', 'ContributorController');
		Route::get('/contributor/{id}', 'ContributorController@index')->name('contributors.index');
		Route::get('/contributors/create/{id}', 'ContributorController@create')->name('contributors.create');

		Route::resource('sprints', 'SprintController');
		Route::get('/sprint/{id}', 'SprintController@index')->name('sprints.index');
		Route::get('/sprints/create/{id}', 'SprintController@create')->name('sprints.create');
		Route::get('/sprints/chart/{id}', 'SprintController@chart')->name('sprints.chart');

		Route::get('/backlog/{id}', 'BacklogController@index')->name('backlogs.index');

		Route::resource('checkins', 'CheckinController');
		Route::get('/checkin/{id}', 'CheckinController@index')->name('checkins.index');
		Route::get('/checkins/create/{id}', 'CheckinController@create')->name('checkins.create');

		Route::resource('points', 'PointController');
		Route::get('/point/{id}', 'PointController@index')->name('points.index');
});
