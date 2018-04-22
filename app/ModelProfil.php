<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelProfil extends Model
{
    protected $table = 'user';
	protected $primaryKey = 'USER_ID';
	public $timestamps = false;
}
