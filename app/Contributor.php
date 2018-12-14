<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contributor extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function points()
    {
        return $this->hasMany(Point::class);
    }
}
