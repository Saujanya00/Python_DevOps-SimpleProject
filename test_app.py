import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_homepage(client):
    """Test the homepage."""
    response = client.get('/')
    assert response.data == b'Hello, Flask!'
    assert response.status_code == 200
