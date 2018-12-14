<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    public function stories()
    {
        return $this->hasMany(Story::class);
    }

    public function contributors()
    {
        return $this->hasMany(Contributor::class);
    }

    public function sprints()
    {
        return $this->hasMany(Sprint::class)->orderBy('created_at', 'desc');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
