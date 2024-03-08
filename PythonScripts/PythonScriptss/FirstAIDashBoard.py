import dash
import dash_core_components as dcc
import dash_html_components as html
import numpy as np

# NumPy script
data = np.array([1, 2, 3, 4, 5])
mean_value = np.mean(data)
sum_value = np.sum(data)
square_root = np.sqrt(data)
power_of_two = np.power(data, 2)

# Dash app
app = dash.Dash(__name__)

app.layout = html.Div(
    children=[
        html.H1(children='Hello Dash'),
        dcc.Graph(
            id='example-graph',
            figure={
                'data': [
                    {'x': data, 'y': power_of_two, 'type': 'bar', 'name': 'Squared'},
                    {'x': data, 'y': square_root, 'type': 'bar', 'name': 'Square Root'},
                ],
                'layout': {
                    'title': 'NumPy and Dash Integration'
                }
            }
        ),
        html.Div([
            html.P(f"Mean Value: {mean_value}"),
            html.P(f"Sum Value: {sum_value}")
        ])
    ]
)

if __name__ == '__main__':
    app.run_server(debug=True)
