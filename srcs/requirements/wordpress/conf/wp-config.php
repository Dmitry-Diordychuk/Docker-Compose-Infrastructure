<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'WordPressDB' );

/** MySQL database username */
define( 'DB_USER', 'kdustin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'secret' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'c6W06{YLhSK6]~Gll#D>g+52)@wJbQ^:C[:NkjF);-c-F3c8nv)6dxjnp_5F<rhc' );
define( 'SECURE_AUTH_KEY',  '0{a_J#Q|0P cDehD8iA)@Wm;2Ciy{Y$bIp<8vcI96O#X];&xSB{MKSW!amV(diyO' );
define( 'LOGGED_IN_KEY',    '0~{UH>*mM40XrO/A; S$-e1J~Qz4%1uUrxc8D7%-<!`m:5<SEq@]JHUOmemcaQpD' );
define( 'NONCE_KEY',        'V^}l;fbrZYd=r]KI;`R6AKoqIj9#DnK(rD6HpT^F@*JF7qaz-0&?DQdw<G>E@zR,' );
define( 'AUTH_SALT',        'mKHnR1I;*sIpczj>#2/sGRlJSW_Pi(s6$x{j&Owtf_Vf%kuV7XDO{Pf#]]<>C{Wl' );
define( 'SECURE_AUTH_SALT', '13}BiQI[ })*7jF=E%~o%6O+}]&WFMc^owO)X2veee~6j3{u1r>U6Q.1CNy5;h{J' );
define( 'LOGGED_IN_SALT',   '._?L=C=$p4NmTY^nlL2f^H@R`k){nj#1--)gzMjOvhW8C5Bf7@8&`O#HXz8Nf<d)' );
define( 'NONCE_SALT',       ';)3o F$,{7hRndb^L]n8kkDXT-ilxiL$*EL*Qs/[w/m,:}>3d^1g>#f4^v{Rj-Qp' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
