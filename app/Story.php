<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Story extends Model
{
    public function tasks()
    {
        return $this->hasMany(Task::class);
    }

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
