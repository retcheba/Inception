<?php
/**
 * Configuration de base de WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en vous rendant sur la page du Codex
 * à l'adresse https://codex.wordpress.org/fr:Modifier_wp-config.php.
 * Ces réglages sont utilisés par wp-config.php pendant l'installation.
 * Vous n'avez pas besoin d'utiliser l'assistant d'installation.
 * Vos réglages MySQL vous seront fournis par votre hébergeur.
 *
 * Ceci est un fichier modèle, à ne pas modifier directement.
 * Copiez ce fichier dans wp-config.php, puis entrez les informations
 * demandées.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'my_database' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'retcheba' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'lol' );

/** Adresse de l'hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/** Type de collation de la base de données. N'y touchez que si vous savez ce que vous faites. */
define( 'DB_COLLATE', '' );

// ** Clés secrètes de WordPress. ** //
/* Authentification unique des clés et salage. */
define( 'AUTH_KEY',         'mettez votre phrase unique ici' );
define( 'SECURE_AUTH_KEY',  'mettez votre phrase unique ici' );
define( 'LOGGED_IN_KEY',    'mettez votre phrase unique ici' );
define( 'NONCE_KEY',        'mettez votre phrase unique ici' );
define( 'AUTH_SALT',        'mettez votre phrase unique ici' );
define( 'SECURE_AUTH_SALT', 'mettez votre phrase unique ici' );
define( 'LOGGED_IN_SALT',   'mettez votre phrase unique ici' );
define( 'NONCE_SALT',       'mettez votre phrase unique ici' );

// ** Préfixe de base de données pour les tables de WordPress. ** //
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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

// ** Langue de WordPress. ** //
define( 'WP_LANG', 'en_US' );

// ** Chemin absolu vers le dossier de WordPress. ** //
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

// ** Réglages des variables de WordPress. ** //
require_once ABSPATH . 'wp-settings.php';