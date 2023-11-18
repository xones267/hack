import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from matplotlib.animation import FuncAnimation

# Generate synthetic data with noise
np.random.seed(42)
X = 2 * np.random.rand(100, 1)
y = 4 + 3 * X + np.random.randn(100, 1)

# Set up the plot
fig, ax = plt.subplots()
sc = ax.scatter([], [], alpha=0.8, label='Data Points')
line, = ax.plot([], [], 'r-', label='Linear Regression Line')
ax.set_xlabel('X-axis')
ax.set_ylabel('Y-axis')
ax.set_title('Linear Regression Animation')
ax.legend()

# Initialize variables
frame_count = 50
frames = min(len(X), frame_count)

# Update function for animation
def update(frame):
    # Plot only the data points and regression line up to the current frame
    X_current = X[:frame]
    y_current = y[:frame]
    model = LinearRegression().fit(X_current, y_current)

    # Update the scatter plot
    sc.set_offsets(np.column_stack((X_current, y_current)))

    # Update the linear regression line
    X_line = np.array([[0], [2]])
    y_line = model.predict(X_line)
    line.set_data(X_line, y_line)

    return sc, line

# Create the animation
animation = FuncAnimation(fig, update, frames=frames, interval=200, blit=True)

# Disconnect animation on close
def on_close(event):
    animation.event_source.stop()

fig.canvas.mpl_connect('close_event', on_close)

# Show the plot
plt.show()
