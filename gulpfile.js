const gulp = require('gulp');
const postcss = require('gulp-postcss');
const sourcemaps = require('gulp-sourcemaps');
const sass = require('gulp-dart-sass');
const cssnano = require('cssnano');
const autoprefixer = require('autoprefixer');

const config = {
    "src": [
        "patterns/base.scss",
    ],
    "watch": "patterns/**/*",
    "target": "web/css",
};


/**
 * Build stuff.
 */
function build() {
    return gulp.src(config.src)
    .pipe(sourcemaps.init())
    .pipe(
        sass.sync({
            sourceMap: true,

        })
        .on('error', sass.logError)
    )
    .pipe(
        postcss([
            autoprefixer(),
            cssnano({
                preset: 'default',
            }),
        ])
    )
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(config.target))
}

/**
 * Watch all files.
 *
 * Make sure you've got your inotify watch count maxed out.
 */
function watch() {
    return gulp.watch(config.watch, {
        ignoreInitial: false,
        events: 'all',
        delay: 300,
    }, build);
}


exports.default = build;
exports.build = build;
exports.watch = watch;
