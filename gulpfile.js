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
    "target": "web/css",
};


// A lovely little hack to 'discover' all the watched files.
// This could also be smarter to map entry files to included files, so we can
// rebuild only the necessary files from the watch() method.
const watched = new Set();
(function() {
    const _render = sass.compiler.renderSync;
    sass.compiler.renderSync = function(opts) {
        const result = _render(opts);
        for (let file of result.stats.includedFiles) {
            watched.add(file);
        }
        return result;
    };
})();


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
    return gulp.watch([...watched], {
        ignoreInitial: true,
        events: 'all',
        delay: 300,
    }, build);
}


exports.default = build;
exports.build = build;
exports.watch = gulp.series(build, watch);
