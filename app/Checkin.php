<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Checkin extends Model
{
    public function sprint()
    {
        return $this->belongsTo(Sprint::class);
    }
}
