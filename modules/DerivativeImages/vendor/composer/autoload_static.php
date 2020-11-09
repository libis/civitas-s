<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit7e740d232a543364e96e0c1b2269e3b0
{
    public static $prefixLengthsPsr4 = array (
        'D' => 
        array (
            'DerivativeImages\\' => 17,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'DerivativeImages\\' => 
        array (
            0 => __DIR__ . '/../..' . '/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit7e740d232a543364e96e0c1b2269e3b0::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit7e740d232a543364e96e0c1b2269e3b0::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}