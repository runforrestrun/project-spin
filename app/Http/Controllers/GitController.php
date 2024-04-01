<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GitController extends Controller
{
    public function getGitObjectsTimestamp()
    {
        $objectsDir = '/var/www/html/.git/objects';

        // Get the last modified timestamp of the directory
        $timestamp = filemtime($objectsDir);

        // Convert the timestamp to a human-readable format
        $dateTime = date('Y-m-d H:i:s', $timestamp);

        return view('version', ['timestamp' => $dateTime]);
    }
}
