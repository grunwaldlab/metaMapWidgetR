HTMLWidgets.widget({

  name: 'meta_map_widget',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        const tsv = x;
        PSMapWidget(el.id, tsv, {});

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
