<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sprint extends Model
{
    public function checkins()
    {
        return $this->hasMany(Checkin::class);
    }

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
